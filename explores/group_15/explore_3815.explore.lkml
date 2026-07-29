# Explore: explore_3815
# Auto-generated LookML Explore File

include: "/views/domain_46/view_11446.view.lkml"
include: "/views/domain_48/view_11448.view.lkml"
include: "/views/domain_49/view_11449.view.lkml"
include: "/views/domain_50/view_11450.view.lkml"

explore: explore_3815 {
  label: "Explore Explore 3815"
  description: "Comprehensive analytics explore joining base view_11446 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_11446
  
  always_filter: {
    filters: [view_11446.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11446.created_at_date: "7 days"]
    unless: [view_11446.id, view_11446.status]
  }

  join: view_11448 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11446.user_id} = ${view_11448.id} ;;
    required_joins: []
  }

  join: view_11449 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11446.account_id} = ${view_11449.account_id} ;;
    required_joins: [view_11448]
  }

  join: view_11450 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11446.category} = ${view_11450.category} ;;
  }

  access_filter: {
    field: view_11446.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11446.is_deleted} = false ;;
}
