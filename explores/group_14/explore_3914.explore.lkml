# Explore: explore_3914
# Auto-generated LookML Explore File

include: "/views/domain_43/view_11743.view.lkml"
include: "/views/domain_45/view_11745.view.lkml"
include: "/views/domain_46/view_11746.view.lkml"
include: "/views/domain_47/view_11747.view.lkml"

explore: explore_3914 {
  label: "Explore Explore 3914"
  description: "Comprehensive analytics explore joining base view_11743 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_11743
  
  always_filter: {
    filters: [view_11743.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11743.created_at_date: "7 days"]
    unless: [view_11743.id, view_11743.status]
  }

  join: view_11745 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11743.user_id} = ${view_11745.id} ;;
    required_joins: []
  }

  join: view_11746 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11743.account_id} = ${view_11746.account_id} ;;
    required_joins: [view_11745]
  }

  join: view_11747 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11743.category} = ${view_11747.category} ;;
  }

  access_filter: {
    field: view_11743.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11743.is_deleted} = false ;;
}
