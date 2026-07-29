# Explore: explore_1887
# Auto-generated LookML Explore File

include: "/views/domain_12/view_05662.view.lkml"
include: "/views/domain_14/view_05664.view.lkml"
include: "/views/domain_15/view_05665.view.lkml"
include: "/views/domain_16/view_05666.view.lkml"

explore: explore_1887 {
  label: "Explore Explore 1887"
  description: "Comprehensive analytics explore joining base view_05662 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_05662
  
  always_filter: {
    filters: [view_05662.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05662.created_at_date: "7 days"]
    unless: [view_05662.id, view_05662.status]
  }

  join: view_05664 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05662.user_id} = ${view_05664.id} ;;
    required_joins: []
  }

  join: view_05665 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05662.account_id} = ${view_05665.account_id} ;;
    required_joins: [view_05664]
  }

  join: view_05666 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05662.category} = ${view_05666.category} ;;
  }

  access_filter: {
    field: view_05662.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05662.is_deleted} = false ;;
}
