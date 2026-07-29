# Explore: explore_3935
# Auto-generated LookML Explore File

include: "/views/domain_06/view_11806.view.lkml"
include: "/views/domain_08/view_11808.view.lkml"
include: "/views/domain_09/view_11809.view.lkml"
include: "/views/domain_10/view_11810.view.lkml"

explore: explore_3935 {
  label: "Explore Explore 3935"
  description: "Comprehensive analytics explore joining base view_11806 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_11806
  
  always_filter: {
    filters: [view_11806.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11806.created_at_date: "7 days"]
    unless: [view_11806.id, view_11806.status]
  }

  join: view_11808 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11806.user_id} = ${view_11808.id} ;;
    required_joins: []
  }

  join: view_11809 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11806.account_id} = ${view_11809.account_id} ;;
    required_joins: [view_11808]
  }

  join: view_11810 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11806.category} = ${view_11810.category} ;;
  }

  access_filter: {
    field: view_11806.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11806.is_deleted} = false ;;
}
