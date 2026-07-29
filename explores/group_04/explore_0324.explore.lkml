# Explore: explore_0324
# Auto-generated LookML Explore File

include: "/views/domain_23/view_00973.view.lkml"
include: "/views/domain_25/view_00975.view.lkml"
include: "/views/domain_26/view_00976.view.lkml"
include: "/views/domain_27/view_00977.view.lkml"

explore: explore_0324 {
  label: "Explore Explore 0324"
  description: "Comprehensive analytics explore joining base view_00973 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_00973
  
  always_filter: {
    filters: [view_00973.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00973.created_at_date: "7 days"]
    unless: [view_00973.id, view_00973.status]
  }

  join: view_00975 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00973.user_id} = ${view_00975.id} ;;
    required_joins: []
  }

  join: view_00976 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00973.account_id} = ${view_00976.account_id} ;;
    required_joins: [view_00975]
  }

  join: view_00977 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00973.category} = ${view_00977.category} ;;
  }

  access_filter: {
    field: view_00973.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00973.is_deleted} = false ;;
}
