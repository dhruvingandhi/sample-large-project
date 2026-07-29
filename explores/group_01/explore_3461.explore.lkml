# Explore: explore_3461
# Auto-generated LookML Explore File

include: "/views/domain_34/view_10384.view.lkml"
include: "/views/domain_36/view_10386.view.lkml"
include: "/views/domain_37/view_10387.view.lkml"
include: "/views/domain_38/view_10388.view.lkml"

explore: explore_3461 {
  label: "Explore Explore 3461"
  description: "Comprehensive analytics explore joining base view_10384 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_10384
  
  always_filter: {
    filters: [view_10384.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10384.created_at_date: "7 days"]
    unless: [view_10384.id, view_10384.status]
  }

  join: view_10386 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10384.user_id} = ${view_10386.id} ;;
    required_joins: []
  }

  join: view_10387 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10384.account_id} = ${view_10387.account_id} ;;
    required_joins: [view_10386]
  }

  join: view_10388 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10384.category} = ${view_10388.category} ;;
  }

  access_filter: {
    field: view_10384.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10384.is_deleted} = false ;;
}
