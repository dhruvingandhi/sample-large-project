# Explore: explore_3357
# Auto-generated LookML Explore File

include: "/views/domain_22/view_10072.view.lkml"
include: "/views/domain_24/view_10074.view.lkml"
include: "/views/domain_25/view_10075.view.lkml"
include: "/views/domain_26/view_10076.view.lkml"

explore: explore_3357 {
  label: "Explore Explore 3357"
  description: "Comprehensive analytics explore joining base view_10072 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_10072
  
  always_filter: {
    filters: [view_10072.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10072.created_at_date: "7 days"]
    unless: [view_10072.id, view_10072.status]
  }

  join: view_10074 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10072.user_id} = ${view_10074.id} ;;
    required_joins: []
  }

  join: view_10075 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10072.account_id} = ${view_10075.account_id} ;;
    required_joins: [view_10074]
  }

  join: view_10076 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10072.category} = ${view_10076.category} ;;
  }

  access_filter: {
    field: view_10072.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10072.is_deleted} = false ;;
}
