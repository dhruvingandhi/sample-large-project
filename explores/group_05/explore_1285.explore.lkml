# Explore: explore_1285
# Auto-generated LookML Explore File

include: "/views/domain_06/view_03856.view.lkml"
include: "/views/domain_08/view_03858.view.lkml"
include: "/views/domain_09/view_03859.view.lkml"
include: "/views/domain_10/view_03860.view.lkml"

explore: explore_1285 {
  label: "Explore Explore 1285"
  description: "Comprehensive analytics explore joining base view_03856 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_03856
  
  always_filter: {
    filters: [view_03856.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03856.created_at_date: "7 days"]
    unless: [view_03856.id, view_03856.status]
  }

  join: view_03858 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03856.user_id} = ${view_03858.id} ;;
    required_joins: []
  }

  join: view_03859 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03856.account_id} = ${view_03859.account_id} ;;
    required_joins: [view_03858]
  }

  join: view_03860 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03856.category} = ${view_03860.category} ;;
  }

  access_filter: {
    field: view_03856.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03856.is_deleted} = false ;;
}
