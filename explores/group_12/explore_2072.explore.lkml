# Explore: explore_2072
# Auto-generated LookML Explore File

include: "/views/domain_17/view_06217.view.lkml"
include: "/views/domain_19/view_06219.view.lkml"
include: "/views/domain_20/view_06220.view.lkml"
include: "/views/domain_21/view_06221.view.lkml"

explore: explore_2072 {
  label: "Explore Explore 2072"
  description: "Comprehensive analytics explore joining base view_06217 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_06217
  
  always_filter: {
    filters: [view_06217.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06217.created_at_date: "7 days"]
    unless: [view_06217.id, view_06217.status]
  }

  join: view_06219 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06217.user_id} = ${view_06219.id} ;;
    required_joins: []
  }

  join: view_06220 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06217.account_id} = ${view_06220.account_id} ;;
    required_joins: [view_06219]
  }

  join: view_06221 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06217.category} = ${view_06221.category} ;;
  }

  access_filter: {
    field: view_06217.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06217.is_deleted} = false ;;
}
