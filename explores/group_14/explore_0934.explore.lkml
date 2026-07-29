# Explore: explore_0934
# Auto-generated LookML Explore File

include: "/views/domain_03/view_02803.view.lkml"
include: "/views/domain_05/view_02805.view.lkml"
include: "/views/domain_06/view_02806.view.lkml"
include: "/views/domain_07/view_02807.view.lkml"

explore: explore_0934 {
  label: "Explore Explore 0934"
  description: "Comprehensive analytics explore joining base view_02803 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_02803
  
  always_filter: {
    filters: [view_02803.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02803.created_at_date: "7 days"]
    unless: [view_02803.id, view_02803.status]
  }

  join: view_02805 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02803.user_id} = ${view_02805.id} ;;
    required_joins: []
  }

  join: view_02806 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02803.account_id} = ${view_02806.account_id} ;;
    required_joins: [view_02805]
  }

  join: view_02807 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02803.category} = ${view_02807.category} ;;
  }

  access_filter: {
    field: view_02803.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02803.is_deleted} = false ;;
}
