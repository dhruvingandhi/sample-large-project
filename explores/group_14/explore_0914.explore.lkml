# Explore: explore_0914
# Auto-generated LookML Explore File

include: "/views/domain_43/view_02743.view.lkml"
include: "/views/domain_45/view_02745.view.lkml"
include: "/views/domain_46/view_02746.view.lkml"
include: "/views/domain_47/view_02747.view.lkml"

explore: explore_0914 {
  label: "Explore Explore 0914"
  description: "Comprehensive analytics explore joining base view_02743 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_02743
  
  always_filter: {
    filters: [view_02743.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02743.created_at_date: "7 days"]
    unless: [view_02743.id, view_02743.status]
  }

  join: view_02745 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02743.user_id} = ${view_02745.id} ;;
    required_joins: []
  }

  join: view_02746 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02743.account_id} = ${view_02746.account_id} ;;
    required_joins: [view_02745]
  }

  join: view_02747 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02743.category} = ${view_02747.category} ;;
  }

  access_filter: {
    field: view_02743.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02743.is_deleted} = false ;;
}
