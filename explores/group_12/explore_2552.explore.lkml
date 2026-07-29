# Explore: explore_2552
# Auto-generated LookML Explore File

include: "/views/domain_07/view_07657.view.lkml"
include: "/views/domain_09/view_07659.view.lkml"
include: "/views/domain_10/view_07660.view.lkml"
include: "/views/domain_11/view_07661.view.lkml"

explore: explore_2552 {
  label: "Explore Explore 2552"
  description: "Comprehensive analytics explore joining base view_07657 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_07657
  
  always_filter: {
    filters: [view_07657.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07657.created_at_date: "7 days"]
    unless: [view_07657.id, view_07657.status]
  }

  join: view_07659 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07657.user_id} = ${view_07659.id} ;;
    required_joins: []
  }

  join: view_07660 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07657.account_id} = ${view_07660.account_id} ;;
    required_joins: [view_07659]
  }

  join: view_07661 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07657.category} = ${view_07661.category} ;;
  }

  access_filter: {
    field: view_07657.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07657.is_deleted} = false ;;
}
