# Explore: explore_0274
# Auto-generated LookML Explore File

include: "/views/domain_23/view_00823.view.lkml"
include: "/views/domain_25/view_00825.view.lkml"
include: "/views/domain_26/view_00826.view.lkml"
include: "/views/domain_27/view_00827.view.lkml"

explore: explore_0274 {
  label: "Explore Explore 0274"
  description: "Comprehensive analytics explore joining base view_00823 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_00823
  
  always_filter: {
    filters: [view_00823.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00823.created_at_date: "7 days"]
    unless: [view_00823.id, view_00823.status]
  }

  join: view_00825 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00823.user_id} = ${view_00825.id} ;;
    required_joins: []
  }

  join: view_00826 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00823.account_id} = ${view_00826.account_id} ;;
    required_joins: [view_00825]
  }

  join: view_00827 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00823.category} = ${view_00827.category} ;;
  }

  access_filter: {
    field: view_00823.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00823.is_deleted} = false ;;
}
