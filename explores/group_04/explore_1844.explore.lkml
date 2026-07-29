# Explore: explore_1844
# Auto-generated LookML Explore File

include: "/views/domain_33/view_05533.view.lkml"
include: "/views/domain_35/view_05535.view.lkml"
include: "/views/domain_36/view_05536.view.lkml"
include: "/views/domain_37/view_05537.view.lkml"

explore: explore_1844 {
  label: "Explore Explore 1844"
  description: "Comprehensive analytics explore joining base view_05533 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_05533
  
  always_filter: {
    filters: [view_05533.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05533.created_at_date: "7 days"]
    unless: [view_05533.id, view_05533.status]
  }

  join: view_05535 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05533.user_id} = ${view_05535.id} ;;
    required_joins: []
  }

  join: view_05536 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05533.account_id} = ${view_05536.account_id} ;;
    required_joins: [view_05535]
  }

  join: view_05537 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05533.category} = ${view_05537.category} ;;
  }

  access_filter: {
    field: view_05533.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05533.is_deleted} = false ;;
}
