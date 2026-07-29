# Explore: explore_2957
# Auto-generated LookML Explore File

include: "/views/domain_22/view_08872.view.lkml"
include: "/views/domain_24/view_08874.view.lkml"
include: "/views/domain_25/view_08875.view.lkml"
include: "/views/domain_26/view_08876.view.lkml"

explore: explore_2957 {
  label: "Explore Explore 2957"
  description: "Comprehensive analytics explore joining base view_08872 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_08872
  
  always_filter: {
    filters: [view_08872.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08872.created_at_date: "7 days"]
    unless: [view_08872.id, view_08872.status]
  }

  join: view_08874 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08872.user_id} = ${view_08874.id} ;;
    required_joins: []
  }

  join: view_08875 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08872.account_id} = ${view_08875.account_id} ;;
    required_joins: [view_08874]
  }

  join: view_08876 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08872.category} = ${view_08876.category} ;;
  }

  access_filter: {
    field: view_08872.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08872.is_deleted} = false ;;
}
