# Explore: explore_3577
# Auto-generated LookML Explore File

include: "/views/domain_32/view_10732.view.lkml"
include: "/views/domain_34/view_10734.view.lkml"
include: "/views/domain_35/view_10735.view.lkml"
include: "/views/domain_36/view_10736.view.lkml"

explore: explore_3577 {
  label: "Explore Explore 3577"
  description: "Comprehensive analytics explore joining base view_10732 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_10732
  
  always_filter: {
    filters: [view_10732.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10732.created_at_date: "7 days"]
    unless: [view_10732.id, view_10732.status]
  }

  join: view_10734 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10732.user_id} = ${view_10734.id} ;;
    required_joins: []
  }

  join: view_10735 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10732.account_id} = ${view_10735.account_id} ;;
    required_joins: [view_10734]
  }

  join: view_10736 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10732.category} = ${view_10736.category} ;;
  }

  access_filter: {
    field: view_10732.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10732.is_deleted} = false ;;
}
