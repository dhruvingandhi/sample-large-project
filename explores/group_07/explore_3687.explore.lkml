# Explore: explore_3687
# Auto-generated LookML Explore File

include: "/views/domain_12/view_11062.view.lkml"
include: "/views/domain_14/view_11064.view.lkml"
include: "/views/domain_15/view_11065.view.lkml"
include: "/views/domain_16/view_11066.view.lkml"

explore: explore_3687 {
  label: "Explore Explore 3687"
  description: "Comprehensive analytics explore joining base view_11062 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_11062
  
  always_filter: {
    filters: [view_11062.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11062.created_at_date: "7 days"]
    unless: [view_11062.id, view_11062.status]
  }

  join: view_11064 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11062.user_id} = ${view_11064.id} ;;
    required_joins: []
  }

  join: view_11065 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11062.account_id} = ${view_11065.account_id} ;;
    required_joins: [view_11064]
  }

  join: view_11066 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11062.category} = ${view_11066.category} ;;
  }

  access_filter: {
    field: view_11062.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11062.is_deleted} = false ;;
}
