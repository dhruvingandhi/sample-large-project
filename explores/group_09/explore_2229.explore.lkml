# Explore: explore_2229
# Auto-generated LookML Explore File

include: "/views/domain_38/view_06688.view.lkml"
include: "/views/domain_40/view_06690.view.lkml"
include: "/views/domain_41/view_06691.view.lkml"
include: "/views/domain_42/view_06692.view.lkml"

explore: explore_2229 {
  label: "Explore Explore 2229"
  description: "Comprehensive analytics explore joining base view_06688 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_06688
  
  always_filter: {
    filters: [view_06688.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06688.created_at_date: "7 days"]
    unless: [view_06688.id, view_06688.status]
  }

  join: view_06690 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06688.user_id} = ${view_06690.id} ;;
    required_joins: []
  }

  join: view_06691 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06688.account_id} = ${view_06691.account_id} ;;
    required_joins: [view_06690]
  }

  join: view_06692 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06688.category} = ${view_06692.category} ;;
  }

  access_filter: {
    field: view_06688.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06688.is_deleted} = false ;;
}
