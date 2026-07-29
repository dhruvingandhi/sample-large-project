# Explore: explore_2214
# Auto-generated LookML Explore File

include: "/views/domain_43/view_06643.view.lkml"
include: "/views/domain_45/view_06645.view.lkml"
include: "/views/domain_46/view_06646.view.lkml"
include: "/views/domain_47/view_06647.view.lkml"

explore: explore_2214 {
  label: "Explore Explore 2214"
  description: "Comprehensive analytics explore joining base view_06643 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_06643
  
  always_filter: {
    filters: [view_06643.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06643.created_at_date: "7 days"]
    unless: [view_06643.id, view_06643.status]
  }

  join: view_06645 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06643.user_id} = ${view_06645.id} ;;
    required_joins: []
  }

  join: view_06646 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06643.account_id} = ${view_06646.account_id} ;;
    required_joins: [view_06645]
  }

  join: view_06647 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06643.category} = ${view_06647.category} ;;
  }

  access_filter: {
    field: view_06643.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06643.is_deleted} = false ;;
}
