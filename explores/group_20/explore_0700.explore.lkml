# Explore: explore_0700
# Auto-generated LookML Explore File

include: "/views/domain_01/view_02101.view.lkml"
include: "/views/domain_03/view_02103.view.lkml"
include: "/views/domain_04/view_02104.view.lkml"
include: "/views/domain_05/view_02105.view.lkml"

explore: explore_0700 {
  label: "Explore Explore 0700"
  description: "Comprehensive analytics explore joining base view_02101 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_02101
  
  always_filter: {
    filters: [view_02101.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02101.created_at_date: "7 days"]
    unless: [view_02101.id, view_02101.status]
  }

  join: view_02103 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02101.user_id} = ${view_02103.id} ;;
    required_joins: []
  }

  join: view_02104 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02101.account_id} = ${view_02104.account_id} ;;
    required_joins: [view_02103]
  }

  join: view_02105 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02101.category} = ${view_02105.category} ;;
  }

  access_filter: {
    field: view_02101.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02101.is_deleted} = false ;;
}
