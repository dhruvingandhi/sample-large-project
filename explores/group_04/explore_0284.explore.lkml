# Explore: explore_0284
# Auto-generated LookML Explore File

include: "/views/domain_03/view_00853.view.lkml"
include: "/views/domain_05/view_00855.view.lkml"
include: "/views/domain_06/view_00856.view.lkml"
include: "/views/domain_07/view_00857.view.lkml"

explore: explore_0284 {
  label: "Explore Explore 0284"
  description: "Comprehensive analytics explore joining base view_00853 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_00853
  
  always_filter: {
    filters: [view_00853.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00853.created_at_date: "7 days"]
    unless: [view_00853.id, view_00853.status]
  }

  join: view_00855 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00853.user_id} = ${view_00855.id} ;;
    required_joins: []
  }

  join: view_00856 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00853.account_id} = ${view_00856.account_id} ;;
    required_joins: [view_00855]
  }

  join: view_00857 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00853.category} = ${view_00857.category} ;;
  }

  access_filter: {
    field: view_00853.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00853.is_deleted} = false ;;
}
