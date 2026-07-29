# Explore: explore_0548
# Auto-generated LookML Explore File

include: "/views/domain_45/view_01645.view.lkml"
include: "/views/domain_47/view_01647.view.lkml"
include: "/views/domain_48/view_01648.view.lkml"
include: "/views/domain_49/view_01649.view.lkml"

explore: explore_0548 {
  label: "Explore Explore 0548"
  description: "Comprehensive analytics explore joining base view_01645 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_01645
  
  always_filter: {
    filters: [view_01645.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01645.created_at_date: "7 days"]
    unless: [view_01645.id, view_01645.status]
  }

  join: view_01647 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01645.user_id} = ${view_01647.id} ;;
    required_joins: []
  }

  join: view_01648 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01645.account_id} = ${view_01648.account_id} ;;
    required_joins: [view_01647]
  }

  join: view_01649 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01645.category} = ${view_01649.category} ;;
  }

  access_filter: {
    field: view_01645.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01645.is_deleted} = false ;;
}
