# Explore: explore_3887
# Auto-generated LookML Explore File

include: "/views/domain_12/view_11662.view.lkml"
include: "/views/domain_14/view_11664.view.lkml"
include: "/views/domain_15/view_11665.view.lkml"
include: "/views/domain_16/view_11666.view.lkml"

explore: explore_3887 {
  label: "Explore Explore 3887"
  description: "Comprehensive analytics explore joining base view_11662 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_11662
  
  always_filter: {
    filters: [view_11662.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11662.created_at_date: "7 days"]
    unless: [view_11662.id, view_11662.status]
  }

  join: view_11664 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11662.user_id} = ${view_11664.id} ;;
    required_joins: []
  }

  join: view_11665 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11662.account_id} = ${view_11665.account_id} ;;
    required_joins: [view_11664]
  }

  join: view_11666 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11662.category} = ${view_11666.category} ;;
  }

  access_filter: {
    field: view_11662.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11662.is_deleted} = false ;;
}
