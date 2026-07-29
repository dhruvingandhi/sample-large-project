# Explore: explore_2697
# Auto-generated LookML Explore File

include: "/views/domain_42/view_08092.view.lkml"
include: "/views/domain_44/view_08094.view.lkml"
include: "/views/domain_45/view_08095.view.lkml"
include: "/views/domain_46/view_08096.view.lkml"

explore: explore_2697 {
  label: "Explore Explore 2697"
  description: "Comprehensive analytics explore joining base view_08092 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_08092
  
  always_filter: {
    filters: [view_08092.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08092.created_at_date: "7 days"]
    unless: [view_08092.id, view_08092.status]
  }

  join: view_08094 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08092.user_id} = ${view_08094.id} ;;
    required_joins: []
  }

  join: view_08095 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08092.account_id} = ${view_08095.account_id} ;;
    required_joins: [view_08094]
  }

  join: view_08096 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08092.category} = ${view_08096.category} ;;
  }

  access_filter: {
    field: view_08092.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08092.is_deleted} = false ;;
}
