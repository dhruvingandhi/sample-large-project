# Explore: explore_3943
# Auto-generated LookML Explore File

include: "/views/domain_30/view_11830.view.lkml"
include: "/views/domain_32/view_11832.view.lkml"
include: "/views/domain_33/view_11833.view.lkml"
include: "/views/domain_34/view_11834.view.lkml"

explore: explore_3943 {
  label: "Explore Explore 3943"
  description: "Comprehensive analytics explore joining base view_11830 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_11830
  
  always_filter: {
    filters: [view_11830.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11830.created_at_date: "7 days"]
    unless: [view_11830.id, view_11830.status]
  }

  join: view_11832 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11830.user_id} = ${view_11832.id} ;;
    required_joins: []
  }

  join: view_11833 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11830.account_id} = ${view_11833.account_id} ;;
    required_joins: [view_11832]
  }

  join: view_11834 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11830.category} = ${view_11834.category} ;;
  }

  access_filter: {
    field: view_11830.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11830.is_deleted} = false ;;
}
