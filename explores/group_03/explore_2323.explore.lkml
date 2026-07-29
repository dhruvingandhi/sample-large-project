# Explore: explore_2323
# Auto-generated LookML Explore File

include: "/views/domain_20/view_06970.view.lkml"
include: "/views/domain_22/view_06972.view.lkml"
include: "/views/domain_23/view_06973.view.lkml"
include: "/views/domain_24/view_06974.view.lkml"

explore: explore_2323 {
  label: "Explore Explore 2323"
  description: "Comprehensive analytics explore joining base view_06970 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_06970
  
  always_filter: {
    filters: [view_06970.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06970.created_at_date: "7 days"]
    unless: [view_06970.id, view_06970.status]
  }

  join: view_06972 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06970.user_id} = ${view_06972.id} ;;
    required_joins: []
  }

  join: view_06973 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06970.account_id} = ${view_06973.account_id} ;;
    required_joins: [view_06972]
  }

  join: view_06974 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06970.category} = ${view_06974.category} ;;
  }

  access_filter: {
    field: view_06970.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06970.is_deleted} = false ;;
}
