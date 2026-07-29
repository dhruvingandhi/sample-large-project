# Explore: explore_2727
# Auto-generated LookML Explore File

include: "/views/domain_32/view_08182.view.lkml"
include: "/views/domain_34/view_08184.view.lkml"
include: "/views/domain_35/view_08185.view.lkml"
include: "/views/domain_36/view_08186.view.lkml"

explore: explore_2727 {
  label: "Explore Explore 2727"
  description: "Comprehensive analytics explore joining base view_08182 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_08182
  
  always_filter: {
    filters: [view_08182.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08182.created_at_date: "7 days"]
    unless: [view_08182.id, view_08182.status]
  }

  join: view_08184 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08182.user_id} = ${view_08184.id} ;;
    required_joins: []
  }

  join: view_08185 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08182.account_id} = ${view_08185.account_id} ;;
    required_joins: [view_08184]
  }

  join: view_08186 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08182.category} = ${view_08186.category} ;;
  }

  access_filter: {
    field: view_08182.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08182.is_deleted} = false ;;
}
