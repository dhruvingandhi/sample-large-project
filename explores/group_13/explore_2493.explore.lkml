# Explore: explore_2493
# Auto-generated LookML Explore File

include: "/views/domain_30/view_07480.view.lkml"
include: "/views/domain_32/view_07482.view.lkml"
include: "/views/domain_33/view_07483.view.lkml"
include: "/views/domain_34/view_07484.view.lkml"

explore: explore_2493 {
  label: "Explore Explore 2493"
  description: "Comprehensive analytics explore joining base view_07480 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_07480
  
  always_filter: {
    filters: [view_07480.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07480.created_at_date: "7 days"]
    unless: [view_07480.id, view_07480.status]
  }

  join: view_07482 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07480.user_id} = ${view_07482.id} ;;
    required_joins: []
  }

  join: view_07483 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07480.account_id} = ${view_07483.account_id} ;;
    required_joins: [view_07482]
  }

  join: view_07484 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07480.category} = ${view_07484.category} ;;
  }

  access_filter: {
    field: view_07480.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07480.is_deleted} = false ;;
}
