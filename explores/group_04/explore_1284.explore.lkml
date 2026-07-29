# Explore: explore_1284
# Auto-generated LookML Explore File

include: "/views/domain_03/view_03853.view.lkml"
include: "/views/domain_05/view_03855.view.lkml"
include: "/views/domain_06/view_03856.view.lkml"
include: "/views/domain_07/view_03857.view.lkml"

explore: explore_1284 {
  label: "Explore Explore 1284"
  description: "Comprehensive analytics explore joining base view_03853 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_03853
  
  always_filter: {
    filters: [view_03853.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03853.created_at_date: "7 days"]
    unless: [view_03853.id, view_03853.status]
  }

  join: view_03855 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03853.user_id} = ${view_03855.id} ;;
    required_joins: []
  }

  join: view_03856 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03853.account_id} = ${view_03856.account_id} ;;
    required_joins: [view_03855]
  }

  join: view_03857 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03853.category} = ${view_03857.category} ;;
  }

  access_filter: {
    field: view_03853.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03853.is_deleted} = false ;;
}
