# Explore: explore_2217
# Auto-generated LookML Explore File

include: "/views/domain_02/view_06652.view.lkml"
include: "/views/domain_04/view_06654.view.lkml"
include: "/views/domain_05/view_06655.view.lkml"
include: "/views/domain_06/view_06656.view.lkml"

explore: explore_2217 {
  label: "Explore Explore 2217"
  description: "Comprehensive analytics explore joining base view_06652 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_06652
  
  always_filter: {
    filters: [view_06652.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06652.created_at_date: "7 days"]
    unless: [view_06652.id, view_06652.status]
  }

  join: view_06654 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06652.user_id} = ${view_06654.id} ;;
    required_joins: []
  }

  join: view_06655 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06652.account_id} = ${view_06655.account_id} ;;
    required_joins: [view_06654]
  }

  join: view_06656 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06652.category} = ${view_06656.category} ;;
  }

  access_filter: {
    field: view_06652.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06652.is_deleted} = false ;;
}
