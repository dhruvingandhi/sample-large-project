# Explore: explore_2547
# Auto-generated LookML Explore File

include: "/views/domain_42/view_07642.view.lkml"
include: "/views/domain_44/view_07644.view.lkml"
include: "/views/domain_45/view_07645.view.lkml"
include: "/views/domain_46/view_07646.view.lkml"

explore: explore_2547 {
  label: "Explore Explore 2547"
  description: "Comprehensive analytics explore joining base view_07642 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_07642
  
  always_filter: {
    filters: [view_07642.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07642.created_at_date: "7 days"]
    unless: [view_07642.id, view_07642.status]
  }

  join: view_07644 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07642.user_id} = ${view_07644.id} ;;
    required_joins: []
  }

  join: view_07645 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07642.account_id} = ${view_07645.account_id} ;;
    required_joins: [view_07644]
  }

  join: view_07646 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07642.category} = ${view_07646.category} ;;
  }

  access_filter: {
    field: view_07642.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07642.is_deleted} = false ;;
}
