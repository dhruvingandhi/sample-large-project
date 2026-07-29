# Explore: explore_2682
# Auto-generated LookML Explore File

include: "/views/domain_47/view_08047.view.lkml"
include: "/views/domain_49/view_08049.view.lkml"
include: "/views/domain_50/view_08050.view.lkml"
include: "/views/domain_01/view_08051.view.lkml"

explore: explore_2682 {
  label: "Explore Explore 2682"
  description: "Comprehensive analytics explore joining base view_08047 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_08047
  
  always_filter: {
    filters: [view_08047.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08047.created_at_date: "7 days"]
    unless: [view_08047.id, view_08047.status]
  }

  join: view_08049 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08047.user_id} = ${view_08049.id} ;;
    required_joins: []
  }

  join: view_08050 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08047.account_id} = ${view_08050.account_id} ;;
    required_joins: [view_08049]
  }

  join: view_08051 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08047.category} = ${view_08051.category} ;;
  }

  access_filter: {
    field: view_08047.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08047.is_deleted} = false ;;
}
