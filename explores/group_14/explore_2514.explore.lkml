# Explore: explore_2514
# Auto-generated LookML Explore File

include: "/views/domain_43/view_07543.view.lkml"
include: "/views/domain_45/view_07545.view.lkml"
include: "/views/domain_46/view_07546.view.lkml"
include: "/views/domain_47/view_07547.view.lkml"

explore: explore_2514 {
  label: "Explore Explore 2514"
  description: "Comprehensive analytics explore joining base view_07543 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_07543
  
  always_filter: {
    filters: [view_07543.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07543.created_at_date: "7 days"]
    unless: [view_07543.id, view_07543.status]
  }

  join: view_07545 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07543.user_id} = ${view_07545.id} ;;
    required_joins: []
  }

  join: view_07546 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07543.account_id} = ${view_07546.account_id} ;;
    required_joins: [view_07545]
  }

  join: view_07547 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07543.category} = ${view_07547.category} ;;
  }

  access_filter: {
    field: view_07543.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07543.is_deleted} = false ;;
}
