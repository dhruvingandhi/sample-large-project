# Explore: explore_1548
# Auto-generated LookML Explore File

include: "/views/domain_45/view_04645.view.lkml"
include: "/views/domain_47/view_04647.view.lkml"
include: "/views/domain_48/view_04648.view.lkml"
include: "/views/domain_49/view_04649.view.lkml"

explore: explore_1548 {
  label: "Explore Explore 1548"
  description: "Comprehensive analytics explore joining base view_04645 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_04645
  
  always_filter: {
    filters: [view_04645.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04645.created_at_date: "7 days"]
    unless: [view_04645.id, view_04645.status]
  }

  join: view_04647 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04645.user_id} = ${view_04647.id} ;;
    required_joins: []
  }

  join: view_04648 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04645.account_id} = ${view_04648.account_id} ;;
    required_joins: [view_04647]
  }

  join: view_04649 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04645.category} = ${view_04649.category} ;;
  }

  access_filter: {
    field: view_04645.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04645.is_deleted} = false ;;
}
