# Explore: explore_3548
# Auto-generated LookML Explore File

include: "/views/domain_45/view_10645.view.lkml"
include: "/views/domain_47/view_10647.view.lkml"
include: "/views/domain_48/view_10648.view.lkml"
include: "/views/domain_49/view_10649.view.lkml"

explore: explore_3548 {
  label: "Explore Explore 3548"
  description: "Comprehensive analytics explore joining base view_10645 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_10645
  
  always_filter: {
    filters: [view_10645.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10645.created_at_date: "7 days"]
    unless: [view_10645.id, view_10645.status]
  }

  join: view_10647 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10645.user_id} = ${view_10647.id} ;;
    required_joins: []
  }

  join: view_10648 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10645.account_id} = ${view_10648.account_id} ;;
    required_joins: [view_10647]
  }

  join: view_10649 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10645.category} = ${view_10649.category} ;;
  }

  access_filter: {
    field: view_10645.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10645.is_deleted} = false ;;
}
