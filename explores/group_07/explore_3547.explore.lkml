# Explore: explore_3547
# Auto-generated LookML Explore File

include: "/views/domain_42/view_10642.view.lkml"
include: "/views/domain_44/view_10644.view.lkml"
include: "/views/domain_45/view_10645.view.lkml"
include: "/views/domain_46/view_10646.view.lkml"

explore: explore_3547 {
  label: "Explore Explore 3547"
  description: "Comprehensive analytics explore joining base view_10642 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_10642
  
  always_filter: {
    filters: [view_10642.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10642.created_at_date: "7 days"]
    unless: [view_10642.id, view_10642.status]
  }

  join: view_10644 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10642.user_id} = ${view_10644.id} ;;
    required_joins: []
  }

  join: view_10645 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10642.account_id} = ${view_10645.account_id} ;;
    required_joins: [view_10644]
  }

  join: view_10646 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10642.category} = ${view_10646.category} ;;
  }

  access_filter: {
    field: view_10642.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10642.is_deleted} = false ;;
}
