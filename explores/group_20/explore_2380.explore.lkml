# Update for 2000 file diff target
# Explore: explore_2380
# Auto-generated LookML Explore File

include: "/views/domain_41/view_07141.view.lkml"
include: "/views/domain_43/view_07143.view.lkml"
include: "/views/domain_44/view_07144.view.lkml"
include: "/views/domain_45/view_07145.view.lkml"

explore: explore_2380 {
  label: "Explore Explore 2380"
  description: "Comprehensive analytics explore joining base view_07141 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_07141
  
  always_filter: {
    filters: [view_07141.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07141.created_at_date: "7 days"]
    unless: [view_07141.id, view_07141.status]
  }

  join: view_07143 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07141.user_id} = ${view_07143.id} ;;
    required_joins: []
  }

  join: view_07144 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07141.account_id} = ${view_07144.account_id} ;;
    required_joins: [view_07143]
  }

  join: view_07145 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07141.category} = ${view_07145.category} ;;
  }

  access_filter: {
    field: view_07141.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07141.is_deleted} = false ;;
}
