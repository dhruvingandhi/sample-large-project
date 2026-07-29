# Explore: explore_1493
# Auto-generated LookML Explore File

include: "/views/domain_30/view_04480.view.lkml"
include: "/views/domain_32/view_04482.view.lkml"
include: "/views/domain_33/view_04483.view.lkml"
include: "/views/domain_34/view_04484.view.lkml"

explore: explore_1493 {
  label: "Explore Explore 1493"
  description: "Comprehensive analytics explore joining base view_04480 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_04480
  
  always_filter: {
    filters: [view_04480.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04480.created_at_date: "7 days"]
    unless: [view_04480.id, view_04480.status]
  }

  join: view_04482 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04480.user_id} = ${view_04482.id} ;;
    required_joins: []
  }

  join: view_04483 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04480.account_id} = ${view_04483.account_id} ;;
    required_joins: [view_04482]
  }

  join: view_04484 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04480.category} = ${view_04484.category} ;;
  }

  access_filter: {
    field: view_04480.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04480.is_deleted} = false ;;
}
