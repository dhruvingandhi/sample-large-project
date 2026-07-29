# Explore: explore_0810
# Auto-generated LookML Explore File

include: "/views/domain_31/view_02431.view.lkml"
include: "/views/domain_33/view_02433.view.lkml"
include: "/views/domain_34/view_02434.view.lkml"
include: "/views/domain_35/view_02435.view.lkml"

explore: explore_0810 {
  label: "Explore Explore 0810"
  description: "Comprehensive analytics explore joining base view_02431 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_02431
  
  always_filter: {
    filters: [view_02431.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02431.created_at_date: "7 days"]
    unless: [view_02431.id, view_02431.status]
  }

  join: view_02433 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02431.user_id} = ${view_02433.id} ;;
    required_joins: []
  }

  join: view_02434 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02431.account_id} = ${view_02434.account_id} ;;
    required_joins: [view_02433]
  }

  join: view_02435 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02431.category} = ${view_02435.category} ;;
  }

  access_filter: {
    field: view_02431.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02431.is_deleted} = false ;;
}
