# Explore: explore_3844
# Auto-generated LookML Explore File

include: "/views/domain_33/view_11533.view.lkml"
include: "/views/domain_35/view_11535.view.lkml"
include: "/views/domain_36/view_11536.view.lkml"
include: "/views/domain_37/view_11537.view.lkml"

explore: explore_3844 {
  label: "Explore Explore 3844"
  description: "Comprehensive analytics explore joining base view_11533 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_11533
  
  always_filter: {
    filters: [view_11533.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11533.created_at_date: "7 days"]
    unless: [view_11533.id, view_11533.status]
  }

  join: view_11535 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11533.user_id} = ${view_11535.id} ;;
    required_joins: []
  }

  join: view_11536 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11533.account_id} = ${view_11536.account_id} ;;
    required_joins: [view_11535]
  }

  join: view_11537 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11533.category} = ${view_11537.category} ;;
  }

  access_filter: {
    field: view_11533.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11533.is_deleted} = false ;;
}
