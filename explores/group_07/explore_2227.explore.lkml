# Explore: explore_2227
# Auto-generated LookML Explore File

include: "/views/domain_32/view_06682.view.lkml"
include: "/views/domain_34/view_06684.view.lkml"
include: "/views/domain_35/view_06685.view.lkml"
include: "/views/domain_36/view_06686.view.lkml"

explore: explore_2227 {
  label: "Explore Explore 2227"
  description: "Comprehensive analytics explore joining base view_06682 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_06682
  
  always_filter: {
    filters: [view_06682.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06682.created_at_date: "7 days"]
    unless: [view_06682.id, view_06682.status]
  }

  join: view_06684 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06682.user_id} = ${view_06684.id} ;;
    required_joins: []
  }

  join: view_06685 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06682.account_id} = ${view_06685.account_id} ;;
    required_joins: [view_06684]
  }

  join: view_06686 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06682.category} = ${view_06686.category} ;;
  }

  access_filter: {
    field: view_06682.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06682.is_deleted} = false ;;
}
