# Explore: explore_2257
# Auto-generated LookML Explore File

include: "/views/domain_22/view_06772.view.lkml"
include: "/views/domain_24/view_06774.view.lkml"
include: "/views/domain_25/view_06775.view.lkml"
include: "/views/domain_26/view_06776.view.lkml"

explore: explore_2257 {
  label: "Explore Explore 2257"
  description: "Comprehensive analytics explore joining base view_06772 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_06772
  
  always_filter: {
    filters: [view_06772.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06772.created_at_date: "7 days"]
    unless: [view_06772.id, view_06772.status]
  }

  join: view_06774 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06772.user_id} = ${view_06774.id} ;;
    required_joins: []
  }

  join: view_06775 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06772.account_id} = ${view_06775.account_id} ;;
    required_joins: [view_06774]
  }

  join: view_06776 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06772.category} = ${view_06776.category} ;;
  }

  access_filter: {
    field: view_06772.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06772.is_deleted} = false ;;
}
