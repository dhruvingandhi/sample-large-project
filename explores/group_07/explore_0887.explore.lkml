# Explore: explore_0887
# Auto-generated LookML Explore File

include: "/views/domain_12/view_02662.view.lkml"
include: "/views/domain_14/view_02664.view.lkml"
include: "/views/domain_15/view_02665.view.lkml"
include: "/views/domain_16/view_02666.view.lkml"

explore: explore_0887 {
  label: "Explore Explore 0887"
  description: "Comprehensive analytics explore joining base view_02662 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_02662
  
  always_filter: {
    filters: [view_02662.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02662.created_at_date: "7 days"]
    unless: [view_02662.id, view_02662.status]
  }

  join: view_02664 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02662.user_id} = ${view_02664.id} ;;
    required_joins: []
  }

  join: view_02665 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02662.account_id} = ${view_02665.account_id} ;;
    required_joins: [view_02664]
  }

  join: view_02666 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02662.category} = ${view_02666.category} ;;
  }

  access_filter: {
    field: view_02662.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02662.is_deleted} = false ;;
}
