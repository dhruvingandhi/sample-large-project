# Explore: explore_3158
# Auto-generated LookML Explore File

include: "/views/domain_25/view_09475.view.lkml"
include: "/views/domain_27/view_09477.view.lkml"
include: "/views/domain_28/view_09478.view.lkml"
include: "/views/domain_29/view_09479.view.lkml"

explore: explore_3158 {
  label: "Explore Explore 3158"
  description: "Comprehensive analytics explore joining base view_09475 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_09475
  
  always_filter: {
    filters: [view_09475.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09475.created_at_date: "7 days"]
    unless: [view_09475.id, view_09475.status]
  }

  join: view_09477 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09475.user_id} = ${view_09477.id} ;;
    required_joins: []
  }

  join: view_09478 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09475.account_id} = ${view_09478.account_id} ;;
    required_joins: [view_09477]
  }

  join: view_09479 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09475.category} = ${view_09479.category} ;;
  }

  access_filter: {
    field: view_09475.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09475.is_deleted} = false ;;
}
