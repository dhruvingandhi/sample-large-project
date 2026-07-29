# Explore: explore_0229
# Auto-generated LookML Explore File

include: "/views/domain_38/view_00688.view.lkml"
include: "/views/domain_40/view_00690.view.lkml"
include: "/views/domain_41/view_00691.view.lkml"
include: "/views/domain_42/view_00692.view.lkml"

explore: explore_0229 {
  label: "Explore Explore 0229"
  description: "Comprehensive analytics explore joining base view_00688 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_00688
  
  always_filter: {
    filters: [view_00688.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00688.created_at_date: "7 days"]
    unless: [view_00688.id, view_00688.status]
  }

  join: view_00690 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00688.user_id} = ${view_00690.id} ;;
    required_joins: []
  }

  join: view_00691 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00688.account_id} = ${view_00691.account_id} ;;
    required_joins: [view_00690]
  }

  join: view_00692 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00688.category} = ${view_00692.category} ;;
  }

  access_filter: {
    field: view_00688.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00688.is_deleted} = false ;;
}
