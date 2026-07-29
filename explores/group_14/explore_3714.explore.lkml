# Explore: explore_3714
# Auto-generated LookML Explore File

include: "/views/domain_43/view_11143.view.lkml"
include: "/views/domain_45/view_11145.view.lkml"
include: "/views/domain_46/view_11146.view.lkml"
include: "/views/domain_47/view_11147.view.lkml"

explore: explore_3714 {
  label: "Explore Explore 3714"
  description: "Comprehensive analytics explore joining base view_11143 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_11143
  
  always_filter: {
    filters: [view_11143.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11143.created_at_date: "7 days"]
    unless: [view_11143.id, view_11143.status]
  }

  join: view_11145 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11143.user_id} = ${view_11145.id} ;;
    required_joins: []
  }

  join: view_11146 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11143.account_id} = ${view_11146.account_id} ;;
    required_joins: [view_11145]
  }

  join: view_11147 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11143.category} = ${view_11147.category} ;;
  }

  access_filter: {
    field: view_11143.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11143.is_deleted} = false ;;
}
