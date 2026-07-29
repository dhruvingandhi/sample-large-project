# Explore: explore_1173
# Auto-generated LookML Explore File

include: "/views/domain_20/view_03520.view.lkml"
include: "/views/domain_22/view_03522.view.lkml"
include: "/views/domain_23/view_03523.view.lkml"
include: "/views/domain_24/view_03524.view.lkml"

explore: explore_1173 {
  label: "Explore Explore 1173"
  description: "Comprehensive analytics explore joining base view_03520 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_03520
  
  always_filter: {
    filters: [view_03520.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03520.created_at_date: "7 days"]
    unless: [view_03520.id, view_03520.status]
  }

  join: view_03522 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03520.user_id} = ${view_03522.id} ;;
    required_joins: []
  }

  join: view_03523 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03520.account_id} = ${view_03523.account_id} ;;
    required_joins: [view_03522]
  }

  join: view_03524 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03520.category} = ${view_03524.category} ;;
  }

  access_filter: {
    field: view_03520.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03520.is_deleted} = false ;;
}
