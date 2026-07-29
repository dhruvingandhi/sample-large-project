# Explore: explore_2714
# Auto-generated LookML Explore File

include: "/views/domain_43/view_08143.view.lkml"
include: "/views/domain_45/view_08145.view.lkml"
include: "/views/domain_46/view_08146.view.lkml"
include: "/views/domain_47/view_08147.view.lkml"

explore: explore_2714 {
  label: "Explore Explore 2714"
  description: "Comprehensive analytics explore joining base view_08143 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_08143
  
  always_filter: {
    filters: [view_08143.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08143.created_at_date: "7 days"]
    unless: [view_08143.id, view_08143.status]
  }

  join: view_08145 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08143.user_id} = ${view_08145.id} ;;
    required_joins: []
  }

  join: view_08146 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08143.account_id} = ${view_08146.account_id} ;;
    required_joins: [view_08145]
  }

  join: view_08147 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08143.category} = ${view_08147.category} ;;
  }

  access_filter: {
    field: view_08143.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08143.is_deleted} = false ;;
}
