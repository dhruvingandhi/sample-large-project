# Explore: explore_2914
# Auto-generated LookML Explore File

include: "/views/domain_43/view_08743.view.lkml"
include: "/views/domain_45/view_08745.view.lkml"
include: "/views/domain_46/view_08746.view.lkml"
include: "/views/domain_47/view_08747.view.lkml"

explore: explore_2914 {
  label: "Explore Explore 2914"
  description: "Comprehensive analytics explore joining base view_08743 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_08743
  
  always_filter: {
    filters: [view_08743.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08743.created_at_date: "7 days"]
    unless: [view_08743.id, view_08743.status]
  }

  join: view_08745 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08743.user_id} = ${view_08745.id} ;;
    required_joins: []
  }

  join: view_08746 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08743.account_id} = ${view_08746.account_id} ;;
    required_joins: [view_08745]
  }

  join: view_08747 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08743.category} = ${view_08747.category} ;;
  }

  access_filter: {
    field: view_08743.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08743.is_deleted} = false ;;
}
