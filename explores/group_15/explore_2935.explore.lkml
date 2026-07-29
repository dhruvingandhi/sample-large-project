# Explore: explore_2935
# Auto-generated LookML Explore File

include: "/views/domain_06/view_08806.view.lkml"
include: "/views/domain_08/view_08808.view.lkml"
include: "/views/domain_09/view_08809.view.lkml"
include: "/views/domain_10/view_08810.view.lkml"

explore: explore_2935 {
  label: "Explore Explore 2935"
  description: "Comprehensive analytics explore joining base view_08806 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_08806
  
  always_filter: {
    filters: [view_08806.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08806.created_at_date: "7 days"]
    unless: [view_08806.id, view_08806.status]
  }

  join: view_08808 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08806.user_id} = ${view_08808.id} ;;
    required_joins: []
  }

  join: view_08809 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08806.account_id} = ${view_08809.account_id} ;;
    required_joins: [view_08808]
  }

  join: view_08810 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08806.category} = ${view_08810.category} ;;
  }

  access_filter: {
    field: view_08806.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08806.is_deleted} = false ;;
}
