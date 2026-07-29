# Explore: explore_1047
# Auto-generated LookML Explore File

include: "/views/domain_42/view_03142.view.lkml"
include: "/views/domain_44/view_03144.view.lkml"
include: "/views/domain_45/view_03145.view.lkml"
include: "/views/domain_46/view_03146.view.lkml"

explore: explore_1047 {
  label: "Explore Explore 1047"
  description: "Comprehensive analytics explore joining base view_03142 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_03142
  
  always_filter: {
    filters: [view_03142.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03142.created_at_date: "7 days"]
    unless: [view_03142.id, view_03142.status]
  }

  join: view_03144 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03142.user_id} = ${view_03144.id} ;;
    required_joins: []
  }

  join: view_03145 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03142.account_id} = ${view_03145.account_id} ;;
    required_joins: [view_03144]
  }

  join: view_03146 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03142.category} = ${view_03146.category} ;;
  }

  access_filter: {
    field: view_03142.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03142.is_deleted} = false ;;
}
