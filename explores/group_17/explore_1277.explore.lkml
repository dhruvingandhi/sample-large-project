# Explore: explore_1277
# Auto-generated LookML Explore File

include: "/views/domain_32/view_03832.view.lkml"
include: "/views/domain_34/view_03834.view.lkml"
include: "/views/domain_35/view_03835.view.lkml"
include: "/views/domain_36/view_03836.view.lkml"

explore: explore_1277 {
  label: "Explore Explore 1277"
  description: "Comprehensive analytics explore joining base view_03832 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_03832
  
  always_filter: {
    filters: [view_03832.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03832.created_at_date: "7 days"]
    unless: [view_03832.id, view_03832.status]
  }

  join: view_03834 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03832.user_id} = ${view_03834.id} ;;
    required_joins: []
  }

  join: view_03835 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03832.account_id} = ${view_03835.account_id} ;;
    required_joins: [view_03834]
  }

  join: view_03836 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03832.category} = ${view_03836.category} ;;
  }

  access_filter: {
    field: view_03832.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03832.is_deleted} = false ;;
}
