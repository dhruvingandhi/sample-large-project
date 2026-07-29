# Explore: explore_3829
# Auto-generated LookML Explore File

include: "/views/domain_38/view_11488.view.lkml"
include: "/views/domain_40/view_11490.view.lkml"
include: "/views/domain_41/view_11491.view.lkml"
include: "/views/domain_42/view_11492.view.lkml"

explore: explore_3829 {
  label: "Explore Explore 3829"
  description: "Comprehensive analytics explore joining base view_11488 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_11488
  
  always_filter: {
    filters: [view_11488.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11488.created_at_date: "7 days"]
    unless: [view_11488.id, view_11488.status]
  }

  join: view_11490 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11488.user_id} = ${view_11490.id} ;;
    required_joins: []
  }

  join: view_11491 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11488.account_id} = ${view_11491.account_id} ;;
    required_joins: [view_11490]
  }

  join: view_11492 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11488.category} = ${view_11492.category} ;;
  }

  access_filter: {
    field: view_11488.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11488.is_deleted} = false ;;
}
