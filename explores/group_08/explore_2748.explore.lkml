# Explore: explore_2748
# Auto-generated LookML Explore File

include: "/views/domain_45/view_08245.view.lkml"
include: "/views/domain_47/view_08247.view.lkml"
include: "/views/domain_48/view_08248.view.lkml"
include: "/views/domain_49/view_08249.view.lkml"

explore: explore_2748 {
  label: "Explore Explore 2748"
  description: "Comprehensive analytics explore joining base view_08245 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_08245
  
  always_filter: {
    filters: [view_08245.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08245.created_at_date: "7 days"]
    unless: [view_08245.id, view_08245.status]
  }

  join: view_08247 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08245.user_id} = ${view_08247.id} ;;
    required_joins: []
  }

  join: view_08248 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08245.account_id} = ${view_08248.account_id} ;;
    required_joins: [view_08247]
  }

  join: view_08249 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08245.category} = ${view_08249.category} ;;
  }

  access_filter: {
    field: view_08245.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08245.is_deleted} = false ;;
}
