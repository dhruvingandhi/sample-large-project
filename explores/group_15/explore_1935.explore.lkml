# Explore: explore_1935
# Auto-generated LookML Explore File

include: "/views/domain_06/view_05806.view.lkml"
include: "/views/domain_08/view_05808.view.lkml"
include: "/views/domain_09/view_05809.view.lkml"
include: "/views/domain_10/view_05810.view.lkml"

explore: explore_1935 {
  label: "Explore Explore 1935"
  description: "Comprehensive analytics explore joining base view_05806 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_05806
  
  always_filter: {
    filters: [view_05806.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05806.created_at_date: "7 days"]
    unless: [view_05806.id, view_05806.status]
  }

  join: view_05808 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05806.user_id} = ${view_05808.id} ;;
    required_joins: []
  }

  join: view_05809 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05806.account_id} = ${view_05809.account_id} ;;
    required_joins: [view_05808]
  }

  join: view_05810 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05806.category} = ${view_05810.category} ;;
  }

  access_filter: {
    field: view_05806.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05806.is_deleted} = false ;;
}
