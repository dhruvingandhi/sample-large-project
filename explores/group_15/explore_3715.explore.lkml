# Explore: explore_3715
# Auto-generated LookML Explore File

include: "/views/domain_46/view_11146.view.lkml"
include: "/views/domain_48/view_11148.view.lkml"
include: "/views/domain_49/view_11149.view.lkml"
include: "/views/domain_50/view_11150.view.lkml"

explore: explore_3715 {
  label: "Explore Explore 3715"
  description: "Comprehensive analytics explore joining base view_11146 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_11146
  
  always_filter: {
    filters: [view_11146.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11146.created_at_date: "7 days"]
    unless: [view_11146.id, view_11146.status]
  }

  join: view_11148 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11146.user_id} = ${view_11148.id} ;;
    required_joins: []
  }

  join: view_11149 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11146.account_id} = ${view_11149.account_id} ;;
    required_joins: [view_11148]
  }

  join: view_11150 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11146.category} = ${view_11150.category} ;;
  }

  access_filter: {
    field: view_11146.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11146.is_deleted} = false ;;
}
